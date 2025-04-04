<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/ghosteater1311/RISC-V_Bitmap_Image_Display">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi9cz7M89DM9pcc8WKlIAk03hHlAjxNIQgGg&s" alt="Logo">
  </a>

<h3 align="center">RISC-V_Bitmap_Image_Display</h3>

  <p align="center">
    This program processed the bitmap image displayed into ARGB Bitmap Display based on RARS.
    <br />
    <a href="Report.pdf"><strong>Explore the docs »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation-guide">Installation Guide</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
### Demo
[![Final][product-demo]](https://github.com/ghosteater1311/RISC-V_Bitmap_Image_Display/tree/main/demo/demo.mp4)
This demo displays a 512x512 .bmp image after processing.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [RARS 1.6](RARS)
* [RISC-V Assembly Language](AssemblyLang)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started
### Prerequisites
- Basic knowledge about Assembly language.
- Ability to understand Algorithms for solving problems.
- Depth knowledge about General Computer Architecture and RISC-V Architecture & Instructions Set.
- The program only execute the bitmap image with the format (.bmp or first 2 Hex Value BM), maximum resolution 512x512 and 24-bit depth color.

_For more information about Assembly language and RISC-V instructions set: [Documentation][doc1]_

### Installation Guide
#### Environment
Java Devlopment Kit Environment

Windows:
  * Download via link: [Here](https://www.oracle.com/java/technologies/downloads/#jdk24-windows)
  * Run the installer.
  * To verify the installation:
  - Run PowerShell as Adminstrator
  ```sh
  java --version
  ```

Mac OS:
  * Download DMG installer via link: [Here](https://www.oracle.com/java/technologies/downloads/#jdk24-mac)
  * Run the DMG installer.
  * To verify the installation:
  - Open terminal
  ```sh
  java -version
  ```

Linux

Suggestion: In Linux, it's easier to download and install java via terminal instead of download through a file.
* apt Package
  ```sh
  sudo apt update
  sudo apt upgrade
  sudo apt install default-jdk
  ```
  - To verify the installation:
  ```sh
  javac -version
  ```
* pacman aarch Package
  ```sh
  sudo pacman -Syu
  sudo pacman -S jdk-openjdk
  ```
  - To verify the installation:
  ```sh
  jdk -v
  ```
* Specific Linux (Red Hat) with Yum or Rpm packages management
  + For Yum
    ```sh
    sudo yum update
    sudo yum upgrade
    sudo yum install java
    ```
    - To verify the installation:
    ```sh
    yum info "java"
    ```
  + For Rpm 
    * Download via link: [Here](https://www.oracle.com/java/technologies/downloads/#jdk24-linux)
    * Installation:
    - Become root:
    ```sh
    su
    ```
    - Change to the directory in which you want to install:
    ```sh
    cd directory_path_name
    ```
    - For example, to install the software in the /usr/java/ directory:
    ```sh
    cd /usr/java
    ```
    - Uninstall any earlier installations of the Java packages:
    ```sh
    rpm -e package_name
    ```
    - Install the package:
    ```sh
    rpm -ivh jdk-24_linux-x64_bin.rpm
    ```
    - To upgrade a package:
    ```sh
    rpm -Uvh jdk-24_linux-x64_bin.rpm
    ```

#### RARS Installation
RARS 1.6 IDE and Simulator

Windows/Mac OS
* Download the rars1_6.jar via release link: [Here](https://github.com/TheThirdOne/rars/releases/tag/v1.6)
* Run the rars1_6.jar

Linux
* Download the rars1_6.jar via release link: [Here](https://github.com/TheThirdOne/rars/releases/tag/v1.6)
* To Use the IDE
  - Open File Manager
  - Open the Folder contain the rars1_6.jar
  - Open with terminal
  ```sh
  java rars1_6.jar
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage
### 
* Download the source code from [Source code](https://github.com/ghosteater1311/RISC-V_Bitmap_Image_Display).

  Or using git:
  ```sh
  git clone https://github.com/ghosteater1311/RISC-V_Bitmap_Image_Display.git
  ```
* Open rars1_6.jar.

_If you don't know how to open rars1_6.jar, please read [RARS Installation](#rars-installation)_

* In [File] options, choose [Open...] and open the source.asm in [src] Folder.

* [Execute] the program.

* In [Tools] options, choose [Bitmap-Display].

* Remain the Unit Width and Height in Pixels at 1, modify the Display Width and Height in Pixels to 512 (maximum resolution).

* Press [Connect-to-Program].

* [Run] the program after execution.

_For more information about how the program works, please read the [Report][doc2]_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->


<!-- CONTRIBUTING -->


<!-- LICENSE -->


<!-- CONTACT -->


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[product-demo]: demo/demo.mp4
[doc1]: risc-v-asm-manual.pdf
[doc2]: Report.pdf
[RARS]: https://github.com/TheThirdOne/rars
[AssemblyLang]: https://en.wikipedia.org/wiki/RISC-V_assembly_language#:~:text=RISC%2DV%20assembly%20language%20is,for%20precise%20control%20over%20hardware.
