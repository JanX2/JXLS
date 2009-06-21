//
//  DHFormat.m
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#include <stdint.h>
#include <string>

#include "xlslib.h"

#if 0
#import "format.h"
#endif

using namespace std;
using namespace xlslib_core;

#import "DHFormat.h"

#define FORMAT(a) ((xlslib_core::format_t *)(a))

@implementation DHFormat
-(id)initWithFormat:(void *)ft
{
	self = [super init];
	
	aFormat = ft;
	
	return self;
}
-(void *)format
{
	return aFormat;
}

@end
