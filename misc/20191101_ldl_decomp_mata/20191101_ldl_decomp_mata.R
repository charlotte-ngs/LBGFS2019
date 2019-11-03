

#' Specify the pedigree
ped <- pedigreemm::pedigree(sire = c(NA,NA,1,1,4,5), 
                            dam = c(NA,NA,2,NA,3,2),
                            label = as.character(1:6))

#' Simplified pedigree without inbreeding
ped <- pedigreemm::pedigree(sire = c(NA,NA,NA,1,3), 
                            dam = c(NA,NA,NA,2,2),
                            label = as.character(1:5))

#' Numerator Relationship Matrix
matA <- as.matrix(pedigreemm::getA(ped = ped))

matR <- t(chol(matA))

getLDL <- function(pmatA){
  matR <- t(chol(pmatA))
  matL <- matR
  diag(matL) <- 1
  return(list(diagD = diag(matR)^2,
              matL  = matL))
}

getLDL(matA)