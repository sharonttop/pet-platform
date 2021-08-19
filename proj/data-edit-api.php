<?php
include __DIR__. '/partials/init.php';

header('Content-Type: application/json');


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
    $_SESSION['user']['nickname'] = $_POST['nickname'];
    $output['error'] = '';
    $output['success'] = true;
} else {
    $output['error'] = '資料沒有修改';
}

echo json_encode($output);


// if($stmt->rowCount()) {
//     $_SESSION['user']['nickname'] = $_POST['nickname'];
//     $output['error'] = '';
//     $output['success'] = true;
// }