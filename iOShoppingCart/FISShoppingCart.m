//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Betty Fung on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{
    
    self.items = [[NSMutableArray alloc] init]; //this needs to be initialized here... tried doing it in addItem method but got errors of unrecognized selector sent to instance blahblahblah. need to ask why! :)
    
    NSUInteger totalPriceInCents = 0;
    
    for(NSNumber *priceOfItem in self.items){
        totalPriceInCents += [priceOfItem integerValue];
    }
    
    return totalPriceInCents;
}



-(void)addItem:(FISItem *)item{
    
    [self.items addObject:item];
    
    //returns nothing
}



-(void)removeItem:(FISItem *)item{

    NSUInteger itemIndex = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemIndex];
    
    //returns nothing
}



-(void)removeAllItemsLikeItem:(FISItem *)item{
    
    do{
        [self removeItem:item];
    } while([self.items containsObject:item]);
    
    //returns nothing
}



-(void)sortItemsByNameAsc{
    //returns nothing
}



-(void)sortItemsByNameDesc{
    //returns nothing
}



-(void)sortItemsByPriceInCentsAsc{
    //returns nothing;
}



-(void)sortItemsByPriceInCentsDesc{
    //returns nothing;
}



-(NSArray *)allItemsWithName:(NSString *)name{
    return @[];
}



-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    return @[];
}



-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    return @[]; 
}

@end
