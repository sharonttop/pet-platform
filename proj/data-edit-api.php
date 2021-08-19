<?php
include __DIR__. '/partials/init.php';

header('Content-Type: application/json');

// $output = [
//     'success' => false,
//     'error' => '資料未做任何修改',
//     'code' => 0,
//     'rowCount' => 0,
//     'postData' => $_POST,
// ];

// 練習題解答：避免直接拜訪時的錯誤訊息
// if(
//     empty($_POST['id']) or
//     empty($_POST['name']) or
//     empty($_POST['nickname']) or
//     empty($_POST['email']) or
//     empty($_POST['password']) or
//     empty($_POST['mobile']) or
//     empty($_POST['address']) or
//     empty($_POST['birthday'])
// ){
//     echo json_encode($output);
//     exit;
// }


// if(mb_strlen($_POST['name'])<2){
//     $output['error'] = '姓名長度太短';
//     $output['code'] = 410;
//     echo json_encode($output);
//     exit;
// }


$sql = "UPDATE `members` SET 
                          `name`=?,
                          `nickname`=?,
                          `password`=?,
                          `mobile`=?,
                          `birthday`=?,
                          `address`=?
                          WHERE `id`=?";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['name'],
    $_POST['nickname'],
    $_POST['password'],
    $_POST['mobile'],
    $_POST['birthday'],
    $_POST['address'],
    $_SESSION['user']['id'],
]);

$output['rowCount'] = $stmt->rowCount(); // 修改的筆數

if($stmt->rowCount()==1){
    $output['success'] = true;
    $output['error'] = '';
} else {
    $output['error'] = '資料沒有修改';
}

echo json_encode($output);

