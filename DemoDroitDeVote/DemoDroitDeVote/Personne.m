//
//  Personne.m
//  DemoDroitDeVote
//
//  Created by iem on 20/10/2016.
//  Copyright © 2016 iem. All rights reserved.
//

#import "Personne.h"

@implementation Personne

+(instancetype)createPersonWithAge:(long)newAge {
    Personne *person = [[Personne alloc] initWithAge:newAge];
    return person;
}
- (instancetype)initWithName:(NSString *)name age:(long)age
{
    self = [super init];
    if (self) {
        _age = age;
        _name = [name copy];
    }
    return self;
}


- (BOOL)canLegalVote{
    return self.age>=18;
}

- (void)vote{
    
}

@end
