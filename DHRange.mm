//
//  DHRange.m
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

#import "xlslib.h"

#import "extformat.h"
#import "range.h"

using namespace std;
using namespace xlslib_core;

#import "DHRange.h"

#define RANGE(a) ((xlslib_core::range *)(a))

@implementation DHRange
-(id)initWithRange:(void *)range
{
	self = [super init];
	
	aRange = range;
	
	return self;
}
-(void *)range
{
	return aRange;
}
-(void)cellColor:(color_name_t)aColor
{
	RANGE(aRange)->cellcolor(aColor);
}
@end
