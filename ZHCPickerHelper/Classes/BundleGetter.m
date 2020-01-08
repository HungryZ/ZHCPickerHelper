//
//  BundleGetter.m
//  Pods-ZHCPickerHelper_Example
//
//  Created by cy on 2020/1/6.
//

#import "BundleGetter.h"

@implementation BundleGetter

+ (NSString *)cityBundlePath {

//    let bundle = Bundle(for: ZHCPickerHelper.self)
//    let path = bundle.path(forResource: "city", ofType: "json")!
//    let dataString = try! String(contentsOfFile: path, encoding: .utf8)
//    let data = dataString.data(using: .utf8)!
    NSBundle * bundle = [NSBundle bundleForClass:[BundleGetter class]];
    NSString * path = [bundle pathForResource:@"city" ofType:@"json"];
    
    return path;
}

@end
