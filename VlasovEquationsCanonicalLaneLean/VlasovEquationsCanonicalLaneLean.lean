import VlasovEquationsCanonicalLaneLean.VlasovKineticSystem
import VlasovEquationsCanonicalLaneLean.VlasovMaxwellSystem
import VlasovEquationsCanonicalLaneLean.VlasovPoissonSystem
import VlasovEquationsCanonicalLaneLean.VlasovWellPosedness
import VlasovEquationsCanonicalLaneLean.VlasovExistenceAndUniqueness
import VlasovEquationsCanonicalLaneLean.VlasovAnalyticFoundation

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

-- This file is the root of the VlasovEquationsCanonicalLaneLean Lean proof package.

def VlasovFinalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem vlasov_final_endgame (A : AdmissibleClass) : VlasovFinalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse