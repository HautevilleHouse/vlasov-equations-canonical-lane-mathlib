import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovEquationPackage where
  phaseSpace : Type u
  distributionFunction : Type v
  collisionlessBoltzmannEquation : Prop
  meanFieldCoupling : Prop
  initialDataRegular : Prop
  localExistence : Prop
  uniqueness : Prop

structure VlasovEquationEvidence (V : VlasovEquationPackage) where
  collisionlessBoltzmannEquationClosed : V.collisionlessBoltzmannEquation
  meanFieldCouplingClosed : V.meanFieldCoupling
  initialDataRegularClosed : V.initialDataRegular
  localExistenceClosed : V.localExistence
  uniquenessClosed : V.uniqueness

def VlasovEquationClosed (V : VlasovEquationPackage) : Prop :=
  V.collisionlessBoltzmannEquation ∧ V.meanFieldCoupling ∧
  V.initialDataRegular ∧ V.localExistence ∧ V.uniqueness

theorem vlasov_equation_closed_from_evidence
    (V : VlasovEquationPackage) (E : VlasovEquationEvidence V) :
    VlasovEquationClosed V := by
  exact And.intro E.collisionlessBoltzmannEquationClosed
    (And.intro E.meanFieldCouplingClosed
      (And.intro E.initialDataRegularClosed
        (And.intro E.localExistenceClosed E.uniquenessClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse