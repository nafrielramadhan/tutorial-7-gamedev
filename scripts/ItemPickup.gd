extends Interactable

@export var item_name: String = "Golden Apple"

func interact():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.inventory.append(item_name)
		print("Picked up:", item_name)
		print("Inventory:", player.inventory)
		queue_free() # hapus object dari dunia
