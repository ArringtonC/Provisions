//
//  ChurchMessageViewController.m
//  Provisions
//
//  Created by Arrington Copeland on 2/15/14.
//  Copyright (c) 2014 Arrington Copeland. All rights reserved.
//

#import "ChurchMessageViewController.h"
#import "MessageDetailViewController.h"

@interface ChurchMessageViewController ()

@end

@implementation ChurchMessageViewController





- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.titlesArray = [NSArray arrayWithObjects:@"Barry",@"Bobby", nil];
    [self performSelector:@selector(selectUserFromParse)];
    
    

    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self performSelector:@selector(selectUserFromParse)];
}





-(void) selectUserFromParse{
    PFQuery *retrieveColors = [PFQuery queryWithClassName:@"Info"];
    [retrieveColors findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            _titlesArray = [[NSArray alloc]initWithArray:objects ];
        }
        [self.tableView reloadData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.titlesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFObject *tempObject = [_titlesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [tempObject objectForKey:@"cellTitle"];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showMessageDetail"]){
        MessageDetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *tempObject = [_titlesArray objectAtIndex:indexPath.row];
        destViewController.messageName = [tempObject objectForKey:@"cellTitle"];
        destViewController.hidesBottomBarWhenPushed = YES;
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//        [self performSegueWithIdentifier:@"showMessageDetail" sender:self];
//    
//}

@end
