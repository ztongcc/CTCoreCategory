//
//  ViewController.m
//  CTCoreCategoryDemo
//
//  Created by Admin on 16/7/11.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "ViewController.h"
#import <NSMutableAttributedString+Attributes.h>
#import <TTTAttributedLabel.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (nonatomic, strong)TTTAttributedLabel * attlab;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString * str = [NSString stringWithFormat:@"This is an example by @www.apple.com/"];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str]; // assume string exists
    NSRange urlRange = [str rangeOfString:@"@www.apple.com/"];
    
    self.attlab = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(20, 20, 210, 300)];
    _attlab.attributedText = string;
    _attlab.lineBreakMode = NSLineBreakByCharWrapping;
    _attlab.numberOfLines = 0;
    _attlab.delegate = self;
    _attlab.linkAttributes = @{kTTTBackgroundFillColorAttributeName:[UIColor whiteColor]};
    _attlab.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.attlab];

    [_attlab addLinkToURL:[NSURL URLWithString:@"http://www.baidu.com"] withRange:urlRange];
    
}

- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url
{
    NSLog(@"url = %@", url.absoluteString);
}

- (void)addAttributedStringTextView
{
    NSString * str = [NSString stringWithFormat:@"This is an example by @www.apple.com/"];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str]; // assume string exists
    NSRange urlRange = [str rangeOfString:@"www.apple.com/"];
    [string addAttribute:NSLinkAttributeName
                   value:@"username://@www.apple.com/"
                   range:urlRange];
    [string addAttribute:NSForegroundColorAttributeName
                   value:[UIColor blueColor]
                   range:urlRange];
    [string addAttribute:NSUnderlineStyleAttributeName
                   value:@(NSUnderlineStyleNone)
                   range:urlRange];
    [string endEditing];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    textView.backgroundColor =[UIColor whiteColor];
    textView.delegate = self;
    [textView setSelectable: YES];
    [textView setEditable:NO];
    textView.attributedText = string;
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
    
    [self.view addSubview:textView];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    NSLog(@"url :%@",URL);
    if ([[URL scheme] isEqualToString:@"username"])
    {
        NSString *username = [URL host];
        NSLog(@"username :%@",username);
        return NO;
    }
    return YES;
}

@end
