extends GridContainer

func  _physics_process(delta):
	if Global.playerhealth == 2:
		$"3/Sprite".hide()
	if Global.playerhealth == 1:
		$"3/Sprite".hide()
		$"2/Sprite".hide()
	if Global.playerhealth <= 0:
		$"3/Sprite".hide()
		$"2/Sprite".hide()
		$"1/Sprite".hide()
