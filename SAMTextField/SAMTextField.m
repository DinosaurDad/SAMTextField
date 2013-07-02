//
//  SAMTextField.m
//  SAMTextField
//
//  Created by Sam Soffes on 3/11/10.
//  Copyright 2010-2013 Sam Soffes. All rights reserved.
//

#import "SAMTextField.h"

@implementation SAMTextField

#pragma mark - Accessors

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
	_placeholderTextColor = placeholderTextColor;

	if (!self.text && self.placeholder) {
		[self setNeedsDisplay];
	}
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self initialize];
    }
    return self;
}


#pragma mark - UITextField

- (CGRect)textRectForBounds:(CGRect)bounds {
	return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], self.textEdgeInsets);
}


- (CGRect)editingRectForBounds:(CGRect)bounds {
	return [self textRectForBounds:bounds];
}


- (CGRect)clearButtonRectForBounds:(CGRect)bounds {
	CGRect rect = [super clearButtonRectForBounds:bounds];
	rect.origin.x += self.clearButtonEdgeInsets.right;
	rect.origin.y += self.clearButtonEdgeInsets.top;
	return rect;
}


- (void)drawPlaceholderInRect:(CGRect)rect {
	if (!self.placeholderTextColor) {
		[super drawPlaceholderInRect:rect];
		return;
	}

    [self.placeholderTextColor setFill];
    [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
}


#pragma mark - Private

- (void)initialize {
	self.textEdgeInsets = UIEdgeInsetsZero;
	self.clearButtonEdgeInsets = UIEdgeInsetsZero;
}

@end
