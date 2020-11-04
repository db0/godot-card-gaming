# This is meant to be a simple container for card objects.
# Just add a Node2D with this script as a child node anywhere you want your hand to be.

extends CardContainer
class_name Hand



### BEGIN Behaviour Constants ###
# The maximum amount of cards allowed to draw in this hand
const hand_size := 12

### END Behaviour Constants ###
#var hand_rect: Vector2

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func draw_card(pile = cfc_config.NMAP.deck) -> Card:
	var card: Card = null
	# A basic function to pull a card from out deck into our hand.
	if pile.get_card_count() and get_card_count() < hand_size: # prevent from drawing more cards than are in our deck and crashing godot.
		# We need to remove the current parent node before adding a different one
		# We simply pick the first one.
		card = pile.get_card(0)
		card.reHost(self)
	return card # Returning the card object for unit testing

func _on_Deck_gui_input(event):
	if event.is_pressed() and event.get_button_index() == 1:
		draw_card() # Replace with function body.


