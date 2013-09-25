::
:: Copyright (c) 2008-2013 the Urho3D project.
::
:: Permission is hereby granted, free of charge, to any person obtaining a copy
:: of this software and associated documentation files (the "Software"), to deal
:: in the Software without restriction, including without limitation the rights
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:: copies of the Software, and to permit persons to whom the Software is
:: furnished to do so, subject to the following conditions:
::
:: The above copyright notice and this permission notice shall be included in
:: all copies or substantial portions of the Software.
::
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
:: THE SOFTWARE.
::

@echo off
cmake -E make_directory Build
if exist CMakeCache.txt. del /F CMakeCache.txt
if exist Build\CMakeCache.txt. del /F Build\CMakeCache.txt
if exist Source\CMakeCache.txt. del /F Source\CMakeCache.txt
if exist CMakeFiles. rd /S /Q CMakeFiles
if exist Build\CMakeFiles. rd /S /Q Build\CMakeFiles
if exist Source\CMakeFiles. rd /S /Q Source\CMakeFiles
cmake -E copy_if_different Docs\Doxyfile.in Doxyfile
echo on
cmake -E chdir Build cmake -G "MinGW Makefiles" %* ..\Source
