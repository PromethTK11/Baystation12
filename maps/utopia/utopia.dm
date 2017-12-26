#if !defined(using_map_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "utopia_announcements.dm"
	#include "utopia_areas.dm"


	//CONTENT
	//#include "../overmap_example/bearcat/bearcat_jobs.dm"
	//#include "../torch/datums/uniforms.dm"
	//#include "../torch/items/cards_ids.dm"
	//#include "../dreyfus/items/clothing.dm"
	#include "utopia_gamemodes.dm"
	#include "utopia_presets.dm"
	#include "utopia_shuttles.dm"

	#include "utopia-1.dmm"
	#include "utopia-2.dmm"
	#include "utopia-3.dmm"
	#include "utopia-4.dmm"
	#include "utopia-5.dmm"
	#include "utopia-6.dmm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/martian_cowboy.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"
	#include "../../code/modules/lobby_music/hardcorner.dm"
	#include "../../code/modules/lobby_music/altwave.dm"
	#include "../../code/modules/lobby_music/soma.dm"
	#include "../../code/modules/lobby_music/dustsaturn.dm"
	#include "../../code/modules/lobby_music/in_orbit.dm"
	#include "../../code/modules/lobby_music/juno.dm"
	#include "../../code/modules/lobby_music/chopin27.dm"
	#include "../../code/modules/lobby_music/chasing_time.dm"

	#define using_map_DATUM /datum/map/utopia

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Utopia
#endif
