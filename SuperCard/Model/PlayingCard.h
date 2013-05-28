//
//  PlayingCard.h
//  Matchismo
//
//  Created by Chris on 5/20/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
