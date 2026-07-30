import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovMaxwellSystem

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure SommerfeldRadiationPackage (P : VlasovAdmittedObject) (VM : VlasovMaxwellPackage P) where
  retardedPotential : Type r
  radiationField : Type f
  energyFlux : Type e
  larmorFormula : Prop
  dipoleApproximation : Prop
  radiationReaction : Prop

structure SommerfeldRadiationEvidence (P : VlasovAdmittedObject) (VM : VlasovMaxwellPackage P)
    (SR : SommerfeldRadiationPackage P VM) where
  larmorFormulaClosed : SR.larmorFormula
  dipoleApproximationClosed : SR.dipoleApproximation
  radiationReactionClosed : SR.radiationReaction

def SommerfeldRadiationClosed (P : VlasovAdmittedObject) (VM : VlasovMaxwellPackage P)
    (SR : SommerfeldRadiationPackage P VM) : Prop :=
  SR.larmorFormula ∧ SR.dipoleApproximation ∧ SR.radiationReaction

theorem sommerfeld_radiation_closed_from_evidence (P : VlasovAdmittedObject) (VM : VlasovMaxwellPackage P)
    (SR : SommerfeldRadiationPackage P VM) (E : SommerfeldRadiationEvidence P VM SR) :
    SommerfeldRadiationClosed P VM SR := by
  exact And.intro E.larmorFormulaClosed
    (And.intro E.dipoleApproximationClosed E.radiationReactionClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse