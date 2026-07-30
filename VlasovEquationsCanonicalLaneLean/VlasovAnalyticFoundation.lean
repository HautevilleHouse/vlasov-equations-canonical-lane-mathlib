import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovKineticSystem
import VlasovEquationsCanonicalLaneLean.VlasovMaxwellSystem
import VlasovEquationsCanonicalLaneLean.VlasovPoissonSystem
import VlasovEquationsCanonicalLaneLean.VlasovWellPosedness
import VlasovEquationsCanonicalLaneLean.VlasovExistenceAndUniqueness

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovAnalyticFoundation where
  kinetic : VlasovKineticSystem
  kineticEvidence : VlasovKineticEvidence kinetic
  maxwell : VlasovMaxwellSystem kinetic
  maxwellEvidence : VlasovMaxwellEvidence maxwell
  poisson : VlasovPoissonSystem kinetic
  poissonEvidence : VlasovPoissonEvidence poisson
  wellPosedness : VlasovWellPosedness kinetic maxwell poisson
  wellPosednessEvidence : VlasovWellPosednessEvidence wellPosedness
  existenceUniqueness : VlasovExistenceAndUniqueness kinetic maxwell poisson wellPosedness
  existenceUniquenessEvidence : VlasovExistenceUniquenessEvidence existenceUniqueness

def VlasovAnalyticFoundationClosed (A : VlasovAnalyticFoundation) : Prop :=
  VlasovKineticClosed A.kinetic ∧
  VlasovMaxwellClosed A.maxwell ∧
  VlasovPoissonClosed A.poisson ∧
  VlasovWellPosednessClosed A.wellPosedness ∧
  VlasovExistenceUniquenessClosed A.existenceUniqueness

theorem vlasov_analytic_foundation_closed_from_evidence (A : VlasovAnalyticFoundation) : VlasovAnalyticFoundationClosed A := by
  exact And.intro (vlasov_kinetic_closed_from_evidence A.kinetic A.kineticEvidence)
    (And.intro (vlasov_maxwell_closed_from_evidence A.maxwell A.maxwellEvidence)
      (And.intro (vlasov_poisson_closed_from_evidence A.poisson A.poissonEvidence)
        (And.intro (vlasov_well_posedness_closed_from_evidence A.wellPosedness A.wellPosednessEvidence)
          (vlasov_existence_uniqueness_closed_from_evidence A.existenceUniqueness A.existenceUniquenessEvidence))))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse