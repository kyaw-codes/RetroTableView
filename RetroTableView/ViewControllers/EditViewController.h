//
//  EditViewController.h
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;

@end

NS_ASSUME_NONNULL_END
