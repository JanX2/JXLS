//
//  DHRange.h
//  DHxls
//
//  Created by David Hoerl on 10/26/08.
//  Copyright 2008 David Hoerl. All rights reserved.
//

@interface DHRange : NSObject {
	void		*aRange;		// xlslib_core::range
}
-(id)initWithRange:(void *)rg;	// xlslib_core::range *
-(void *)range;

-(void)cellColor:(color_name_t)aColor;

@end
