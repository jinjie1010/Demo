//
//  ViewController.m
//  lineSpacingDemo
//
//  Created by jinjie on 2019/5/8.
//  Copyright © 2019 jinjie. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+lineHeight.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test11];
}

//默认是垂直居中的
- (void)test1 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！";
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    label.frame = CGRectMake(20, 200, 200, 100);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
}

//高度设置为文字的font的高度
- (void)test2 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！";
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.pointSize);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
}

//高度设置为font的2倍，同时设置为两行会怎么样
//结论：只显示了1行
- (void)test3 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.pointSize * 2);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
}

//高度设置为lineHeight的2倍，同时设置为两行会怎么样
//结论：正常显示两行 所以说labe高度至少要是lineHeight的两倍
- (void)test4 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
}

//高度设置为lineHeight的2倍还多呢，同时设置为两行会怎么样
//结论：正常显示两行，行间距没有发生变化，上下间距变了
- (void)test5 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
}

//自动适配高度完整显示
- (void)test6 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

#pragma mark 设置行间距
- (void)test7 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    //设置行间距
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineSpacing = 20;
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0,label.text.length)];
    label.attributedText = attribute;
    
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

//上面的行间距会有点大，这里其实是行间距 + lineHeight
- (void)test8 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    //设置行间距
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineSpacing = 8 - label.font.lineHeight;
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0,label.text.length)];
    label.attributedText = attribute;
    
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

#pragma mark - lineHeight

//文本的高度是正确的，但是显示在了行底
- (void)test9 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    //设置行高
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.maximumLineHeight = label.font.lineHeight + 4;
    paragraph.minimumLineHeight = label.font.lineHeight + 4;
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0,label.text.length)];
    label.attributedText = attribute;
    
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

//加入baseline
- (void)test10 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    //设置行高
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.maximumLineHeight = 28;
    paragraph.minimumLineHeight = 28;
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0,label.text.length)];
    CGFloat baseLineOffset =(28 - label.font.lineHeight) / 4; //为什么是4，不是2？
    [attribute addAttribute:NSBaselineOffsetAttributeName value:@(baseLineOffset) range:NSMakeRange(0,label.text.length)];
    label.attributedText = attribute;
    
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

- (void)test11 {
    UILabel *label = [UILabel new];
    label.text = @"今天天气不错！我们一起出去玩吧，去公园玩怎么样？";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    NSLog(@"lineHeight:%f.2",label.font.lineHeight);
    label.frame = CGRectMake(20, 200, 200, label.font.lineHeight * 2 + 50);
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    //设置行高
    label.lineHeight = 28;
    label.lineHeight = 30;
    
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    NSLog(@"size: w %f,h %f",size.width,size.height);
    label.frame = CGRectMake(20, 200, 200, size.height);
}

@end
