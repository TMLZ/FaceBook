//
//  PostViewController.m
//  FaceBook
//
//  Created by Tyler Miller on 6/5/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIView *actionItemsContainerView;
@property (weak, nonatomic) IBOutlet UIView *postContainerView;
@property (weak, nonatomic) IBOutlet UIView *commentContainerView;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
- (IBAction)onTap:(id)sender;

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.postContainerView.layer.cornerRadius = 2;
    self.postContainerView.layer.shadowOffset = CGSizeMake(1, 1);
    self.postContainerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.postContainerView.layer.shadowRadius = 2.0f;
    self.postContainerView.layer.shadowOpacity = 0.20f;

    self.commentTextField.delegate = self;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.commentTextField.frame.size.height)];
    leftView.backgroundColor = self.commentTextField.backgroundColor;
    self.commentTextField.leftView = leftView;
    self.commentTextField.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // Adjust position up
    NSLog(@"I need to move up");
    
    [UIView animateWithDuration: .54
                          delay: 0
         usingSpringWithDamping: 1
          initialSpringVelocity: 0
                        options: 0
                     animations: ^
     {
        self.commentContainerView.center = CGPointMake(self.commentContainerView.center.x, self.commentContainerView.center.y-170);
     }
                     completion: nil
     ];

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // Adjust position down
    NSLog(@"I need to move down");
    
    [UIView animateWithDuration: .54
                          delay: 0
         usingSpringWithDamping: 1
          initialSpringVelocity: 0
                        options: 0
                     animations: ^
     {
        self.commentContainerView.center = CGPointMake(self.commentContainerView.center.x, self.commentContainerView.center.y+170);
     }
                     completion: nil
     ];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
@end
