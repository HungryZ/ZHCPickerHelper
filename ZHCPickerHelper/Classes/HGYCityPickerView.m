//
//  HGYCityPickerView.m
//  ZHCPickerHelper
//
//  Created by cy on 2020/1/14.
//

#import "HGYCityPickerView.h"

@implementation HGYCityPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configDataSource];
    }
    return self;
}

- (void)configDataSource {
    NSBundle *bundle = [NSBundle bundleForClass:HGYCityPickerView.class];
    NSString *path = [bundle pathForResource:@"city" ofType:@"json"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    gem sources --add https://rubygems.org/ --remove https://gems.ruby-china.com/
}

@end
