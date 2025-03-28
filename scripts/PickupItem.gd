# PickupItem.gd
extends Interactable    # cukup ini aja, jangan class_name lagi

@export var item_name: String = "Ball"

func interact():
	var player = get_node("/root/Level1/Player")
	player.inventory.append(item_name)
	print("Picked up:", item_name)
	print("Inventory:", player.inventory)
	queue_free()
