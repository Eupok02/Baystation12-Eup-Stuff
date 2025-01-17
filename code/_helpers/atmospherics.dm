/obj/proc/analyze_gases(obj/A, mob/user, mode)
	user.visible_message("<span class='notice'>\The [user] has used \an [src] on \the [A].</span>")
	A.add_fingerprint(user)

	var/air_contents = A.return_air()
	if(!air_contents)
		to_chat(user, "<span class='warning'>Your [src] flashes a red light as it fails to analyze \the [A].</span>")
		return 0

	var/list/result = atmosanalyzer_scan(A, air_contents, mode)
	print_atmos_analysis(user, result)
	return 1

/proc/print_atmos_analysis(user, list/result)
	to_chat(user, SPAN_NOTICE("[result]"))
