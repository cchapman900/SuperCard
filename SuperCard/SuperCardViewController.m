//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SuperCardViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface SuperCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic)Deck *deck;

@end

@implementation SuperCardViewController

-(Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    
    return _deck;
}

-(void)setPlayingCardView:(PlayingCardView *)playingCardView
{
    _playingCardView = playingCardView;
    [self drawRandomPlayingCard];
}

-(void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.suit = playingCard.suit;
        self.playingCardView.rank = playingCard.rank;
    }
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [UIView transitionWithView:self.playingCardView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        if (!self.playingCardView.faceUp) {
                            [self drawRandomPlayingCard];
                        }
                        self.playingCardView.faceUp = !self.playingCardView.faceUp;
                    }
                    completion:NULL];
}

@end
