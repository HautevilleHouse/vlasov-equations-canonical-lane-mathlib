import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure PhaseSpace (M : Type u) [TopologicalSpace M] where
  position : Type v
  momentum : Type w
  cotangentBundle : Type x
  symplecticForm : Type y
  positionTopology : TopologicalSpace position
  momentumTopology : TopologicalSpace momentum
  smoothStructure : Prop
  symplecticStructure : Prop

structure VlasovAdmittedObject where
  phaseSpace : PhaseSpace (M : Type u)
  distributionFunction : Type d
  backgroundFields : Type f
  collisionOperator : Type c
  phaseSpaceDimension : ℕ
  distributionFunctionSmooth : Prop
  collisionOperatorDefined : Prop
  admissibleConclusion : distributionFunctionSmooth ∧ collisionOperatorDefined

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse