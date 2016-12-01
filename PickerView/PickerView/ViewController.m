//
//  ViewController.m
//  PickerView
//
//  Created by iem on 03/11/2016.
//  Copyright © 2016 iem. All rights reserved.
//

#import "ViewController.h"


#define ACTIONS_COMP 0
#define FEELING_COMP 1
static NSInteger titleForRowCount=0;
@interface ViewController ()

@property(nonatomic,strong) NSArray *actions;
@property(nonatomic,strong) NSArray *feelings;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.actions=@[@"dors", @"mange", @"suis en cours", @"galère", @"cours",
                   @"poireaute"];
    self.feelings=@[@";)", @":)", @":(", @":O", @"8)", @":o", @":D", @"mdr",@"lol" ];

}


#pragma mark -
#pragma mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    static NSInteger titleForRowCount = 0;//Initialisation exécutée une seule fois
    titleForRowCount++;
    NSLog(@"Nb appels: %ld / comp: %ld / row: %ld", titleForRowCount,component,row);
    
    if(component == ACTIONS_COMP){
        return self.actions[row];
    }
    else{
        return self.feelings[row];
    }
     return 0;
}

- (IBAction)tweetTouched:(id)sender {
    
    NSString *action;
    NSString *feeling;
    NSString *msg;
    NSString *concat;
    
    if([self.textField hasText]){
        msg = self.textField.text;
    }
    else {
        msg=@"";
    }
    NSInteger row = [self.pickerView selectedRowInComponent:ACTIONS_COMP];
    action = self.actions[row];
    feeling = self.feelings[[self.pickerView selectedRowInComponent:FEELING_COMP]];
     concat=[NSString stringWithFormat:@"%@.Je %@. et je me sens %@",msg, action, feeling];
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:concat];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                       message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
        
    
    
    NSLog(@"%@",concat);
 
}

#pragma mark -
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == ACTIONS_COMP){
        return self.actions.count;
    }
    else{
        return self.feelings.count;
    }
}

#pragma mark
#pragma mark Actions

- (IBAction)didEndOnExit:(id)sender {
    [self dismissKeyboard];
}
- (IBAction)backgroundTap:(id)sender {
    [self dismissKeyboard];
    }

- (void) dismissKeyboard{
    [self.view endEditing:true];

}

@end

















