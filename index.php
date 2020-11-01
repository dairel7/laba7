<meta charset="utf-8">
<style type="text/css">
	body {
		display: flex;
		flex-direction: column;
		align-items: center;
		font-family: Arial, Helvetica, sans-serif;
	}

	.post {
		width: 800px;
		margin: 20px;
		padding: 20px;
		border-radius: 10px;
		box-shadow: 0 0 5px rgba(0,0,0,0.5);
	}
	.post .title {
		font-weight: bold;
		font-size: 30px;
		margin: 10px 0px;
		border-bottom: solid 1px grey;
	}
	.post .footer {
		text-align: right;
		margin-top: 10px;
	}
</style>
<?php
	require "db_link.php";
	$db_link = mysqli_connect($host, $user, $password, $database)
		    or die("Ошибка " . mysqli_error($db_link));

	$sql = "SELECT * FROM `posts`";
	$result = mysqli_query($db_link, $sql);

	while ( $row = mysqli_fetch_assoc($result) ) {
		$id    = $row["post_id"];
		$title = $row["title"];
		$text  = $row["text"];
		$date  = $row["date"];

		?>
			<div class="post">
				<div class="title"><?=$title;?></div>
				<div class="text"><?=$text;?></div>
				<div class="footer"><?=$date;?></div>
			</div>
		<?php
	}

	mysqli_free_result($result);
	mysqli_close($db_link);
?>