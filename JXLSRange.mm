//
//  JXLSRange.m
//  JXLS
//
//  Created by David Hoerl on 10/26/08.
//  Copyright (c) 2008-2013 David Hoerl. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//  Copyright (c) 2013 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import "xlslib.h"

#import "extformat.h"
#import "range.h"

using namespace std;
using namespace xlslib_core;

#import "JXLSRange.h"

#define RANGE(a) ((xlslib_core::range *)(a))

@implementation JXLSRange
{
	void		*aRange;		// xlslib_core::range
}

- (id)initWithRange:(void *)range
{
	self = [super init];
	
	aRange = range;
	
	return self;
}
- (void *)range
{
	return aRange;
}
- (void)cellColor:(color_name_t)aColor
{
	RANGE(aRange)->cellcolor(aColor);
}
@end
