//
//  JXLS.h
//  JXLS
//
//  Created by David Hoerl on 10/6/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import <Foundation/Foundation.h>

//! Project version number for JXLSiOS.
FOUNDATION_EXPORT double JXLSVersionNumber;

//! Project version string for JXLSiOS.
FOUNDATION_EXPORT const unsigned char JXLSVersionString[];

#if (TARGET_OS_IPHONE || defined(COCOAPODS_POD_AVAILABLE_JXLS))
#import "xlslib.h"
#import "JXLSWorkBook.h"
#import "JXLSWorkSheet.h"
#import "JXLSCell.h"
#import "JXLSExtendedFormat.h"
#import "JXLSFont.h"
#import "JXLSFormat.h"
#import "JXLSRange.h"
#elif TARGET_OS_MAC
#import <JXLS/xlslib.h>
#import <JXLS/JXLSWorkBook.h>
#import <JXLS/JXLSWorkSheet.h>
#import <JXLS/JXLSCell.h>
#import <JXLS/JXLSExtendedFormat.h>
#import <JXLS/JXLSFont.h>
#import <JXLS/JXLSFormat.h>
#import <JXLS/JXLSRange.h>
#endif
