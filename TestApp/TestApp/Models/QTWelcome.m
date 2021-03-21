#import "QTWelcome.h"

@implementation QTWelcome

- (instancetype)initFromDictionary:(NSDictionary*)dictionary {
    self = [super init];
    
    if (self) {
        self.articles = [dictionary valueForKey:@"articles"];
    }
    
    return self;
}
@end

@implementation QTArticle

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.author = [dictionary valueForKey:@"author"];
        self.theDescription = [dictionary valueForKey:@"description"];
    }
    return self;
}
@end

@implementation QTSource
@end
