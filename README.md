JXLS
====

JXLS is an ObjC++ wrapper and framework for xlslib. xlslib is a C++/C library to construct Microsoft Excel™ .xls files in code. 

This Framework is based on the xlslib open source project and includes it as a git submodule.

To configure this project, you should 

	git submodule update --init --recursive

after cloning from within your JXLS git repo.

The xlconfig.h file was produced by doing a "./bootstrap" inside the root xlslib folder - you can replace it with the same if you wish. This library has only been tested on 64-bit Intel as it uses ARC.

There is an Xcode project for building on iOS, but it is not actively maintained. If it doesn’t *just work* please fix and send a pull request!

Updating
--------

If you have been using JXLS versions before 1.0, you will have to change your imports to the umbrella header used in 1.0+:

    #import <JXLS/JXLS.h>


License
-------

UNLESS OTHERWISE SPECIFIED WITHIN THE FILES OR PROJECTS, ALL SOFTWARE ON THIS SITE IS SUBJECT TO THE FOLLOWING LICENSING CONDITIONS [BSD LICENSE]:

Copyright (c) 2008-2013 David Hoerl
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 • Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

 • Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

 • Neither the name of David Hoerl nor the names of other contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


Usage
-----

You can integrate JXLS into your project via CocoaPods or manually as described below. 

Add “JXLS.xcodeproj” to your project (preferably into “Frameworks” to keep things tidy).

###Xcode 4

In your target’s “Build Phases”:

* Add Build Phase (+-button pull-down menu) > Copy Files
* Destination: Frameworks
* Change name to “Copy Frameworks” to keep things clean

###Xcode 5 or 6

In your target’s “Build Phases”:

* Editor (menu) > Add Build Phase > Add Copy Files Build Phase
* Destination: Frameworks
* Change name to “Copy Frameworks” to keep things clean

###Both

Add “JXLS.framework” to the following build phases (via the +-buttons):

* “Target Dependencies”
* “Link Binary With Libraries”
* “Copy Frameworks” (created above)

Set “Runpath Search Paths” to  

    @loader_path/../Frameworks

in the “Build Settings” of your target or add

    LD_RUNPATH_SEARCH_PATHS = @loader_path/../Frameworks

to the respective `.xcconfig` file, if you use them.

And finally import the header in your code:

    #import <JXLS/JXLS.h>
