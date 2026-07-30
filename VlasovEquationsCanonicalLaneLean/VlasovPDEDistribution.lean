import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovPDEDistribution where
  phaseSpace : Type u
  phaseTopology : TopologicalSpace phaseSpace
  distributionFunction : Type v
  timeParameter : Type w
  spatialPosition : Type x
  velocity : Type y
  collisionlessBoltzmannEquation : Prop
  initialDistribution : Prop
  boundaryConditions : Prop

structure VlasovPDEDistributionEvidence (D : VlasovPDEDistribution) where
  collisionlessBoltzmannEquationClosed : D.collisionlessBoltzmannEquation
  initialDistributionClosed : D.initialDistribution
  boundaryConditionsClosed : D.boundaryConditions

def VlasovPDEDistributionClosed (D : VlasovPDEDistribution) : Prop := 
  D.collisionlessBoltzmannEquation ∧ D.initialDistribution ∧ D.boundaryConditions

theorem vlasov_pde_distribution_closed_from_evidence
    (D : VlasovPDEDistribution) (E : VlasovPDEDistributionEvidence D) :
    VlasovPDEDistributionClosed D := by
  exact And.intro E.collisionlessBoltzmannEquationClosed
    (And.intro E.initialDistributionClosed E.boundaryConditionsClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse