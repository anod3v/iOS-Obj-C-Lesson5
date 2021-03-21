//
//  NewsCollectionViewCell.m
//  TestApp
//
//  Created by Andrey on 21/03/2021.
//

#import "NewsCollectionViewCell.h"

@implementation NewsCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, [self.contentView bounds].size.width - 20, 50)];
//        [self.mainLabel setText:@"Hi, how are you?"];
        [self.mainLabel setTextColor:[UIColor redColor]];
        [self.mainLabel setBackgroundColor:[UIColor whiteColor]];
        [self.mainLabel setTextAlignment:NSTextAlignmentCenter];
        [self.mainLabel setFont:[UIFont systemFontOfSize:30 weight:UIFontWeightBold]];
        [self.contentView addSubview:self.mainLabel];

    }
    return self;
}

-(void)configureLabel:(NSString *)text {
    [self.mainLabel setText:text];
}


@end
