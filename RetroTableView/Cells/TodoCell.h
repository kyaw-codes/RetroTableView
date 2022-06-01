//
//  TodoCell.h
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import <UIKit/UIKit.h>
#import "TodoVo.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
@property (weak, nonatomic) IBOutlet UIView *badgeContainerView;

- (void)configureCellWithVo:(TodoVO *)vo;
- (UILabel *)badgeLabel;

@end

NS_ASSUME_NONNULL_END
