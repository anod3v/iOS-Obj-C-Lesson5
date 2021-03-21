//
//  TabBar.m
//  TestApp
//
//  Created by Andrey on 21/03/2021.
//

#import "TabBar.h"
#import "ViewController.h"
#import "AnotherViewController.h"

@interface TabBar ()

@end

@implementation TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        ViewController *first = [[ViewController alloc] init];
        if (@available(iOS 13.0, *)) {
            first.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"News" image:[UIImage systemImageNamed:@"house"] tag:0];
        } else {
            // Fallback on earlier versions
        }
        
        AnotherViewController *second = [[AnotherViewController alloc] init];
        second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Placeholder" image:[UIImage systemImageNamed:@"phone"] tag:0];
        [second.view setBackgroundColor:[UIColor greenColor]];
        
        self.viewControllers = @[first, second];
        [self.tabBar setTintColor:[UIColor blueColor]];
        [self setSelectedIndex:0];
        return self;
    }
    return self;
}

@end
