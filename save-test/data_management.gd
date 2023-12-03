extends Node

var save_path: String = "res://save.dat";

var data = 'Hello World';

func save_data(data_to_save):
	var file = FileAccess.open(save_path, FileAccess.WRITE);
	file.store_string(data_to_save);

func load_data() -> String:
	var file = FileAccess.open(save_path, FileAccess.READ);
	var saved_data = file.get_as_text();
	return saved_data;
