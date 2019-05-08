//
//  UILabel+lineHeight.m
//  lineSpacingDemo
//
//  Created by jinjie on 2019/5/8.
//  Copyright © 2019 jinjie. All rights reserved.
//

#import "UILabel+lineHeight.h"

@implementation UILabel (lineHeight)

- (void)setLineHeight:(CGFloat)lineHeight {
    NSMutableAttributedString *attribute = nil;
    if (self.attributedText) {
        attribute = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    } else if (self.text) {
        attribute = [[NSMutableAttributedString alloc] initWithString:self.text];
    } else {
        return;
    }
    NSMutableParagraphStyle *att = [attribute attribute:NSParagraphStyleAttributeName atIndex:0 longestEffectiveRange:nil inRange:NSMakeRange(0, attribute.length)];
    if (att) {
        att.minimumLineHeight = lineHeight;
        att.maximumLineHeight = lineHeight;
    } else {
        att = [NSMutableParagraphStyle new];
        att.maximumLineHeight = lineHeight;
        att.minimumLineHeight = lineHeight;
    }
    [attribute addAttribute:NSParagraphStyleAttributeName value:att range:NSMakeRange(0,attribute.length)];
    CGFloat baseLineOffset =(lineHeight - self.font.lineHeight) / 4; //为什么是4，不是2？
    [attribute addAttribute:NSBaselineOffsetAttributeName value:@(baseLineOffset) range:NSMakeRange(0, attribute.length)];
    self.attributedText = attribute;
}

- (CGFloat)lineHeight {
    NSMutableAttributedString *attribute = nil;
    if (!self.attributedText) {
        return self.font.lineHeight;
    }
    NSMutableParagraphStyle *att = [self.attributedText attribute:NSParagraphStyleAttributeName atIndex:0 longestEffectiveRange:nil inRange:NSMakeRange(0, attribute.length)];
    if (att && att.maximumLineHeight > 0) {
        return att.maximumLineHeight;
    } else {
        return self.font.lineHeight;
    }
    return self.font.lineHeight;
}

@end
