//
//  ViewController.m
//  SBRFoursquareProject
//
//  Created by Suma Reddy on 10/28/14.
//  Copyright (c) 2014 Flatiron. All rights reserved.
//

#import "ViewController.h"
#import <Foursquare-API-v2/Foursquare2.h>
#import <CoreLocation/CoreLocation.h>
#import "VenueTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *outdoorPicture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.outdoorPicture.alpha = 0.5;
    

}

- (IBAction)loginButton:(id)sender
{
    
    
        [Foursquare2 authorizeWithCallback:^(BOOL success, id result)
         {
            if (success) {
                  [Foursquare2 userGetCheckins:@"self"
                                         limit:@10
                                        offset:@0
                                          sort:0
                                         after:nil
                                        before:nil
                                      callback:^(BOOL success, id result) {
                                          NSArray *itemsArray = result[@"response"][@"checkins"][@"items"];
                                          for (NSDictionary *item in itemsArray)
                                          {
                                              NSString *name = item[@"venue"][@"name"];
                                              NSString *location = item[@"venue"][@"location"][@"formattedAddress"][0];
                                              NSLog(@"name: %@, location: %@", name, location);
                                          }
                        }];
            }
        }];
}

//-(void)anotherMethod
//{
//    NSMutableArray *placeNameArray = [[NSMutableArray alloc] init];
//    placeNameArray = [self.placeNames addObjectsFromArray:<#(NSArray *)#>]
//    
//    [Foursquare2 authorizeWithCallback:^(BOOL success, id result) {
//        {
//            if (success)
//            {
//                [Foursquare2 userGetCheckins:@"self"
//                                       limit:@10
//                                      offset:@0
//                                        sort:0
//                                       after:nil
//                                      before:nil
//                                    callback:^(BOOL success, id result)
//                {
//                                    NSArray *itemsArray = result[@"response"][@"checkins"][@"items"];
//                    for (NSDictionary *item in itemsArray)
//                    {
//                        NSString *name = item[@"venue"][@"name"];
//                        NSString *location = item[@"venue"][@"location"][@"formattedAddress"];
//                        NSLog(@"name: %@, location: %@", name, location);
//                    }
//                }];
//                    
//            }
//        }
//        
//    }];
//}

//-(NSMutableArray)checkinLocations
//{
//    self.placeNames = [[NSMutableArray alloc]initWithArray:@[name];
//    self.placeLocations = [[NSMutableArray alloc]initWithArray:@[locations];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    VenueTableViewController *destinationVC = segue.desti WnationViewController;
//    NSIndexPath *selectedPath = [self.loginButton indexPathForSelectedRow];
//    ViewController *currentCheckins = [self. objectAtIndex:selectedPath.row];
//    
//    destinationVC.selectedPath = currentCheckins;
}

@end

