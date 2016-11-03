//
//  ViewController.m
//  DemoDroitDeVote
//
//  Created by iem on 20/10/2016.
//  Copyright © 2016 iem. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *monLabel;
@property (weak, nonatomic) IBOutlet UILabel *droitVote;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UISlider *sliderAge;

@property(strong,nonatomic) Personne *toto;
@end

@implementation ViewController

//Personne *toto;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self monLabel] setText:@"Coucou"];
     self.toto=[[Personne alloc] initWithName:@"toto" age:15];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refresh {
    NSDate *now = [[NSDate alloc] initWithTimeIntervalSinceNow:0.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setLocalizedDateFormatFromTemplate:@"dd/MM/yy'T'HH:mm:ss"];
    NSLog(@"%@", [dateFormatter stringFromDate:now]); // 2 janv. 2001
    [self.monLabel setText:[dateFormatter stringFromDate:now]];
    
}
- (IBAction)slideChange:()sender {
    
    long age = (long)self.sliderAge.value;
    self.toto.age=age;
    NSLog(@"%@", [NSString stringWithFormat:@"%ld",self.toto.age]);
    [self.age  setText: [NSString stringWithFormat:@"%ld",self.toto.age]];
    Boolean droitVote=[self.toto canLegalVote];
    if(droitVote==true){
        self.droitVote.text=@"OUI";
    }else{
        self.droitVote.text=@"NON";
        
    }
}
- (IBAction)marryClick {
    NSLog(@"marry");
    Personne *mickey = [[Personne alloc]initWithName:@"mickey" age:(long)_sliderAge.value];
    Personne *minnie = [[Personne alloc]initWithName:@"minnie" age:(long)_sliderAge.value];
    
    mickey.spouse=minnie;
    minnie.spouse=mickey;
    
}


@end
