#if !defined(using_map_DATUM)

	#include "curie_areas.dm"
	//#include "curie_shuttles.dm"
	#include "curie_presets.dm"
	#include "curie_jobs.dm"

	#include "../exodus/exodus_areas.dm"

	#include "../shared/exodus_torch/areas.dm"
	#include "../shared/exodus_torch/presets.dm"
	#include "../shared/exodus_torch/zas_tests.dm"
	#include "../shared/exodus_torch/loadout/loadout_gloves.dm"
	#include "../shared/exodus_torch/loadout/loadout_head.dm"
	#include "../shared/exodus_torch/loadout/loadout_shoes.dm"
	#include "../shared/exodus_torch/loadout/loadout_suit.dm"

	#include "../exodus/Loadout/loadout_accessories.dm"
	#include "../exodus/Loadout/loadout_eyes.dm"
	#include "../exodus/Loadout/loadout_head.dm"
	#include "../exodus/Loadout/loadout_shoes.dm"
	#include "../exodus/Loadout/loadout_suit.dm"
	#include "../exodus/Loadout/loadout_uniform.dm"
	#include "../exodus/Loadout/loadout_xeno.dm"

	#include "curie-1.dmm"
	#include "curie-2.dmm"
	#include "curie-3.dmm"
	#include "curie-4.dmm"
	#include "curie-5.dmm"
	#include "curie-6.dmm"

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

	#include "../dreyfus/items/papers.dm"
	#include "../dreyfus/items/tools.dm"
	#include "../dreyfus/structures/airlock.dm"
	#include "../dreyfus/structures/blast_door.dm"
	#include "../dreyfus/structures/closet.dm"
	#include "../dreyfus/structures/curtains.dm"
	#include "../dreyfus/structures/door_assembly.dm"
	#include "../dreyfus/structures/flooring.dm"
	#include "../dreyfus/structures/flooring_decals.dm"
	#include "../dreyfus/structures/flooring_premades.dm"
	#include "../dreyfus/structures/furniture.dm"
	#include "../dreyfus/structures/gym.dm"
	#include "../dreyfus/structures/tile_types.dm"
	#include "../dreyfus/structures/wall_icons.dm"
	#include "../dreyfus/structures/walls.dm"
	#include "../dreyfus/structures/machinery.dm"

	#define using_map_DATUM /datum/map/curie

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Curie
#endif
