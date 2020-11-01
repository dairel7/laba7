<meta charset="utf-8">
<?php
	require "db_link.php";
	$db_link = mysqli_connect($host, $user, $password, $database)
	 or die("Ошибка " . mysqli_error($db_link));

	$edit_title = "";
	$edit_text  = "";
	$action     = "add_new";
	$panel      = "hidden";

	if ( isset($_POST["add_new"]) ) {
		$title = $_POST["title"];
		$text  = str_replace("\n", "<br>", $_POST["text"]);
		$date  = date("Y-m-d H:i:s");

		$sql = "INSERT INTO `posts` VALUES (NULL, '$title', '$text', '$date')";
		mysqli_query($db_link, $sql);
	}

	if ( isset($_POST["edit"]) ) {
		$post_id =  $_POST["id"];
		$sql = "SELECT * FROM `posts` WHERE `post_id` = $post_id";
		$result = mysqli_query($db_link, $sql);

		$row = mysqli_fetch_assoc($result);
		mysqli_free_result($result);

		$edit_title = $row["title"];
		$edit_text  = $row["text"];
		$action     = "edit_post";
		$panel      = "";
	}

	if ( isset($_POST["edit_post"]) ) {
		$id    = $_POST["id"];
		$title = $_POST["title"];
		$text  = str_replace("\n", "<br>", $_POST["text"]);
		$date  = date("Y-m-d H:i:s");

		$sql = "UPDATE `posts` SET `title`='$title',`text`='$text',`date`='$date' WHERE `post_id` = $id";
		mysqli_query($db_link, $sql);
	}

	if ( isset($_POST["remove"]) ) {
		$id  = $_POST["id"];
		$sql = "DELETE FROM `posts` WHERE `post_id` = $id";
		mysqli_query($db_link, $sql);
	}
	
		mysqli_close($db_link);
?>

<head>
	<style type="text/css">
		body {
			display: flex;
			flex-direction: column;
			align-items: center;
			font-family: Arial, Helvetica, sans-serif;
		}
		.content {
			width: 800px;
			margin-top: 50px;
		}

		#editor form {
			display: flex;
			flex-direction: column;
		}

		.hidden { display: none; }

		#post_list td button { width: 100%; }
		#post_list td { text-align: center; }
	</style>
</head>
<body>
	<table id="post_list" class="content">
		<tr>
			<td colspan="4"><button>add new</button></td>
		</tr>
		<tr>
			<th>ID</th>
			<th>title</th>
			<th>edit</th>
			<th>remove</th>
		</tr>
		<?php
			$sql = "SELECT * FROM `posts`";
			$result = mysqli_query($db_link, $sql);

			while ( $row = mysqli_fetch_assoc($result) ) {
				$id    = $row["post_id"];
				$title = $row["title"];
				?>
					<tr>
						<td><?=$id;?></td>
						<td><?=$title;?></td>
						<td>
							<form method="POST">
								<input type="hidden" name="id" value="<?=$id;?>">
								<input type="submit" name="edit" value="edit">
							</form>
						</td>
						<td>
							<form method="POST">
								<input type="hidden" name="id" value="<?=$id;?>">
								<input type="submit" name="remove" value="remove">
							</form>
						</td>
					</tr>
				<?php
			}

			mysqli_free_result($result);
		?>
	</table>
	<div id="editor" class="content <?=$panel;?>">
		<form method="POST">
			<div class="control">
				<button>back</button>
				<input type="hidden" name="id" value="<?=$post_id;?>">
				<input type="submit" name="<?=$action;?>" value="<?=$action;?>">
			</div>
			<input type="text" name="title" value="<?=$edit_title;?>">
			<textarea name="text"><?=$edit_text;?></textarea>
		</form>
	</div>

	<script type="text/javascript">
		document
			.querySelector("#post_list button")
			.addEventListener("click", function(ev){
				document
					.querySelector("#editor")
					.classList.toggle("hidden");

				ev.target.innerText = (ev.target.innerText == "back")
					? "add new"
					: "back";
			})

		document
			.querySelector("#editor button")
			.addEventListener("click", function(ev){
				ev.preventDefault();
				document
					.querySelector("#post_list button")
					.click();
			})
	</script>
</body>