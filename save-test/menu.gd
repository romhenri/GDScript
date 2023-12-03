extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass;

func _on_button_pressed():
	var data: String = get_node('LineEdit').text;
	get_node('LineEdit').clear();
	DataManagement.save_data(data);
	#print(data);

func _button_load_pressed():
	var loaded_data = DataManagement.load_data();
	get_node('LoadedData').text = loaded_data;
	#print (loaded_data);
