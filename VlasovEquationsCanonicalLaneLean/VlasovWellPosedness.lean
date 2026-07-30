import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovKineticSystem
import VlasovEquationsCanonicalLaneLean.VlasovMaxwellSystem
import VlasovEquationsCanonicalLaneLean.VlasovPoissonSystem

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovWellPosedness {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} where
  localExistence : Prop
  uniqueness : Prop
  continuousDependence : Prop
  stability : Prop

structure VlasovWellPosednessEvidence {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} (W : VlasovWellPosedness V M P) where
  localExistenceClosed : W.localExistence
  uniquenessClosed : W.uniqueness
  continuousDependenceClosed : W.continuousDependence
  stabilityClosed : W.stability

def VlasovWellPosednessClosed {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} (W : VlasovWellPosedness V M P) : Prop :=
  W.localExistence ∧ W.uniqueness ∧ W.continuousDependence ∧ W.stability

theorem vlasov_well_posedness_closed_from_evidence {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} (W : VlasovWellPosedness V M P) (E : VlasovWellPosednessEvidence W) : VlasovWellPosednessClosed W := by
  exact And.intro E.localExistenceClosed
    (And.intro E.uniquenessClosed
      (And.intro E.continuousDependenceClosed E.stabilityClosed))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse