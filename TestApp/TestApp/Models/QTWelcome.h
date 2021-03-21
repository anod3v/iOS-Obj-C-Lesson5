#import <Foundation/Foundation.h>

@class QTWelcome;
@class QTArticle;
@class QTSource;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface QTWelcome : NSObject
@property (nonatomic, copy)   NSString *status;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, copy)   NSArray<QTArticle *> *articles;
@end

@interface QTArticle : NSObject
@property (nonatomic, strong)         QTSource *source;
@property (nonatomic, copy)           NSString *author;
@property (nonatomic, copy)           NSString *title;
@property (nonatomic, copy)           NSString *theDescription;
@property (nonatomic, copy)           NSString *url;
@property (nonatomic, nullable, copy) NSString *urlToImage;
@property (nonatomic, copy)           NSString *publishedAt;
@property (nonatomic, nullable, copy) NSString *content;

- (instancetype)initFromDictionary:(NSDictionary*)dictionary;
@end

@interface QTSource : NSObject
@property (nonatomic, nullable, copy) NSString *identifier;
@property (nonatomic, copy)           NSString *name;
@end

NS_ASSUME_NONNULL_END
