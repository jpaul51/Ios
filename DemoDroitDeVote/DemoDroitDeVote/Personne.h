//
//  Personne.h
//  DemoDroitDeVote
//
//  Created by iem on 20/10/2016.
//  Copyright © 2016 iem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject
@property(nonatomic) NSString *name;
@property(nonatomic) long age;
@property(nonatomic,weak)Personne *spouse;


// Déclarations des méthodes
- (instancetype)initWithName:(NSString *)name age:(long)age;
- (instancetype)initWithAge:(long)age;
- (BOOL)canLegalVote;
- (void)vote;

@end
