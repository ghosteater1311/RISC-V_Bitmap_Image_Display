.eqv BITMAP_DISPLAY, 0x10010000

.data
    input_prompt: .asciz "Enter location and .bmp image to display (Ex: D:/image/image.bmp): " 
    error_scale: .asciz "Invalid image scale (512x512)!\n"
    error_format: .asciz "Invalid image format (.bmp)!\n"
    input_buffer: .space 256          
    debug_mem: .space 1100000
    main_mem: .space 1100000
    error_open: .asciz "Cannot find the file!" 
	    
.text
.global main
    main:
    
    # Get file input
    get_input:
        li a7, 4            
        la a0, input_prompt
        ecall

        li a7, 8            
        la a0, input_buffer      
        li a1, 256          
        ecall

    # Replace "\n" with "\0"
        la t0, input_buffer
    remove_newline:
        lb t1, (t0)
        beqz t1, open_file  
        li t2, 10           
        beq t1, t2, replace_newline
        addi t0, t0, 1
        j remove_newline

    # Replace the character
    replace_newline:
        sb zero, (t0)       
    
    # Open the file
    open_file:
        li a7, 1024         
        la a0, input_buffer
        li a1, 0            
        ecall
        mv t0, a0           
        blt t0, zero, file_error 
    
    # Read the file
    read_file:
        li   t1, 54
        la   a1, main_mem
        mv   a0, t0
        mv   a2, t1
        li   a7, 63         
        ecall
        blt  a0, t1, file_error  
    
    # Check file format
    check_file_format:
        la   t2, main_mem
        lbu  t3, 0(t2)       
        lbu  t4, 1(t2)       
        li   t5, 'B'
        bne  t3, t5, format_error
        li   t5, 'M'
        bne  t4, t5, format_error
    
    # Check image resolution
    check_image_res:
        addi t3, t2, 18
        lw   t4, 0(t3)       
        addi t3, t2, 22
        lw   t5, 0(t3)       
    
        li t6, 512           
        bgt t4, t6, resolution_error   
        bgt t5, t6, resolution_error   
    
    # Get begin position of pixel data
    get_position:
        addi t3, t2, 10
        lw   t6, 0(t3)       
    
    # Move the pointer to the position of begin pixel data
    file_seek:
        mv   a0, t0
        mv   a1, t6
        li   a2, 0           # SEEK_SET
        li   a7, 62          
        ecall
        blt  a0, zero, end
    
    # Calculate pixel data for display on Bitmap Display
    pixel_calculate:
        li    s10, 3
        mul   s7, t4, s10   # Calculate RowSize (Padding 3 byte RGB)     
        mul   s8, s7, t5    # Calculate PixelData = RowSize x Height
    
    # Read the pixel data
    read_pixel:
        la   a1, main_mem
        mv   a0, t0
        mv   a2, s8
        li   a7, 63
        ecall
        blt  a0, s8, end
    
    # Initial Bitmap Display for output
    init:
        li a3, BITMAP_DISPLAY
        mv s1, t5    # Height of the image
        mv s2, t4    # Width of the image
    
#------------------------------------------------------------------------------------------------------
# Algorithm for displaying:                                                                           |
#												      |
# s5 = width of the image.                                                                            |
# s6 = height of the image.                                                                           |
#                                                                                                     |
# Loop from bottom up to access each rows.                                                            |
# For each rows, loop from left to right to access each columns refers for each pixels.               |
# For each columns (aka pixels) in the row, process the color and display immediately to the display. | 
#                                                                                                     |
# The default color format of bitmap image it's BGR. 						      |
# Implementation of pixel in a row of bitmap image: [B1 G1 R1] [B2 G2 R2] [B3 G3 R3] ... [Bn Gn Rn].  |
# To display image on Bitmap Display, we need to convert BGR color format into RGB color format.      |
# It means convert 0x00BBGGRR -> 0x00RRGGBB.                                                          |
# Each value on the hexadecimal value it's 4 bit.                                                     |
#                                                                                                     |
# To do that, we use shift left logic and bitwise operation to evaluate the exactly value of the color|
# refers to RGB format to display the image with right color as accurately as possible.               |
#------------------------------------------------------------------------------------------------------
    
    # Algorithm implement
    display:    
        loop_rows:
            addi s1, s1, -1     # Loop from bottom up to access first row of bitmap image              
            blt  s1, zero, end  # Branch if all rows of the image has been processed -> jump to end pro     
            mul s9, s1, s7      # Calculate the offset to access index of pixel in the row      
            la  t3, main_mem    # Get the address of the image header, in this case to access each pixe    
            add t3, t3, s9      # Get the begin address of the pixel data of the current row      
            mv s4, s2           # Reset the width of the row after access each columns (aka pixels)                      
            mv s5, t3           # Init pointer to process each pixels in the row           
        
        loop_cols:
            beqz s4, next_row   # Branch if all pixels in a row have been processed -> jump to next row            
            lbu t1, 0(s5)       # Get the B value 0xBB     
            lbu t2, 1(s5)       # Get the G value 0xGG   
            lbu s11, 2(s5)      # Get the R value 0xRR  
            slli s11, s11, 16   # Shift left logical s10 = 0x000000RR -> 0x00RR0000
            slli t2, t2, 8      # Shift left logical t2 = 0x000000GG -> 0x0000GG00
            or   s11, s11, t2   # Logical OR: s10 or t2 -> 0x00RRGG00
            or   s11, s11, t1   # Logical OR: s10 or t1 -> 0x00RRGGBB
            sw  s11, 0(a3)      # Store the value into Bitmap Display address to display
            addi a3, a3, 4      # Move to the next pixel on Bitmap Display (each 4 bytes)
            addi s5, s5, 3      # Move to the next pixel on image after process 3 byte RGB color format 
            addi s4, s4, -1     # Decrease the width of the image to avoid process the same pixel for many times
            j loop_cols         # Jump to next pixel
        
        next_row:
            j loop_rows
    end:
        # Close the file
        close_file:
            mv a0, t0
            li a7, 57   
            ecall
        
        # Exit the Program
        exit:
            li a0, 0
            li a7, 10
            ecall

# Error Handling
# Open file error handle
file_error:
    li a7, 4
    la a0, error_open
    ecall
    j end

# Resolution of image error handle
resolution_error:
    li a7, 4
    la a0, error_scale
    ecall
    j end

# Format file error handle
format_error:
    li a7, 4
    la a0, error_format
    ecall
    j end
