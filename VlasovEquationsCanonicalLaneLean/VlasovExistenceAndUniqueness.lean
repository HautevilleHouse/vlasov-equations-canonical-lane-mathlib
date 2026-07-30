import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovWellPosedness

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovExistenceAndUniqueness {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} {W : VlasovWellPosedness V M P} where
  maximalExistenceTime : Prop
  uniquenessOnMaximalInterval : Prop
  blowupCriterion : Prop

structure VlasovExistenceUniquenessEvidence {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} {W : VlasovWellPosedness V M P} (E : VlasovExistenceAndUniqueness V M P W) where
  maximalExistenceTimeClosed : E.maximalExistenceTime
  uniquenessOnMaximalIntervalClosed : E.uniquenessOnMaximalInterval
  blowupCriterionClosed : E.blowupCriterion

def VlasovExistenceUniquenessClosed {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} {W : VlasovWellPosedness V M P} (E : VlasovExistenceAndUniqueness V M P W) : Prop :=
  E.maximalExistenceTime ∧ E.uniquenessOnMaximalInterval ∧ E.blowupCriterion

theorem vlasov_existence_uniqueness_closed_from_evidence {V : VlasovKineticSystem} {M : VlasovMaxwellSystem V} {P : VlasovPoissonSystem V} {W : VlasovWellPosedness V M P} (E : VlasovExistenceAndUniqueness V M P W) (Ev : VlasovExistenceUniquenessEvidence E) : VlasovExistenceUniquenessClosed E := by
  exact And.intro Ev.maximalExistenceTimeClosed
    (And.intro Ev.uniquenessOnMaximalIntervalClosed Ev.blowupCriterionClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse