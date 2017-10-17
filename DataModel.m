//
//  DataModel.m
//  ConquerKancolleEvent
//
//  Created by Gu Han on 9/29/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "DataModel.h"


@interface DataModel()

@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSArray *kinds;

@end


@implementation DataModel

- (DataModel *)initWithDataFile:(NSString *)filename {
  self = [super init];
  if (self) {
    [self getDataWithDataFile:filename];
  }
  return self;
}

- (void) getDataWithDataFile:(NSString *)filename {
  
  NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  self.data = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  NSLog(@"%@", [self.data description]);
  self.kinds = [self.data allKeys];
  NSMutableDictionary *mutableData = [NSMutableDictionary dictionaryWithDictionary:self.data];
  
  //Add spectial "空" as null value
  mutableData[@"空"] = @[@"空"];
  self.data = [NSDictionary dictionaryWithDictionary:mutableData];
  NSMutableArray *mutableKinds = [NSMutableArray arrayWithArray:self.kinds];
  [mutableKinds insertObject:@"空" atIndex:0];
  self.kinds = [NSArray arrayWithArray:mutableKinds];
}

- (NSUInteger) getDataKindsCount {
  return [self.kinds count];
}

- (NSUInteger) getDataCountWithKindIndex:(NSUInteger) index {
  NSArray *dataArray = self.data[self.kinds[index]];
  return [dataArray count];
}

- (NSString *) getDataKindeAtIndex: (NSUInteger) index {
  return self.kinds[index];
}

- (NSString *) getDataAtIndex:(NSUInteger) index withKind:(NSString *) kind {
  NSArray *dataArray = self.data[kind];
  return dataArray[index];
}

@end
