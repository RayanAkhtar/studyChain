// ---------------------------------------------  Mathematics THEME  --------------------------------------------- //


// ------------------  Calculus here   ------------------ //
/*
CREATE (n:Subject{
	name:'calculus',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});


CREATE (n:Subject{
	name: 'basic arithmetic',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'proofs',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'differentiation',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'integration',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'limits',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'limit ratio test',
	subject: 'limits',
	type: 'topic',
	description:'The study of limit testing with ratios',
	requires: ['proofs', 'limits'],
	links: 'www.example.com',
	approvals: 23,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'lhopitals rule',
	subject: 'limits',
	type: 'topic',
	description:'The study of limit testing with ratios',
	requires: ['proofs', 'limits', 'differentiation'],
	links: 'www.example.com',
	approvals: 23,
	rejections: 30,
	comments: [],
	suggestions: [] ,
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'chain rule',
	subject: 'differentiation',
	type: 'topic',
	description:'Technique for differentiation' ,
	requires: ['differentiation'],
	links: 'www.example.com',
	approvals: 97,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'product rule',
	subject: 'differentiation',
	type: 'topic',
	description:'Technique for differentiation' ,
	requires: ['differentiation'],
	links: 'www.example.com',
	approvals: 80,
	rejections: 40,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integration by Parts',
	subject: 'integration',
	type: 'topic',
	description: 'Technique for integration',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integration by Substitution',
	subject: 'integration',
	type: 'topic',
	description: 'Technique for integration',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 5,
	rejections: 2,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});


CREATE (n:Subject{
	name: 'functions',
	subject: 'calculus',
	type: 'topic',
	description: 'A special type of set',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integration preliminaries',
	subject: 'integration',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'integrating a constant',
	subject: 'integration preliminaries',
	type: 'topic',
	description: 'How to integrate a number such as 1, 2, e, pi, etc...',
	requires: ['integration preliminaries'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integrating a positive power',
	subject: 'integration preliminaries',
	type: 'topic',
	description: 'How to integrate terms such as x, x^2, x^3',
	requires: ['integration preliminaries'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integrating a negative power',
	subject: 'integration preliminaries',
	type: 'topic',
	description: 'How to integrate a terms such as x^-1, x^-2 etc...',
	requires: ['integration preliminaries'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integrating a fractional power',
	subject: 'integration preliminaries',
	type: 'topic',
	description: 'How to integrate a terms such as x^0.5, x^3.5 etc...',
	requires: ['integration preliminaries'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integrating a denominator variable',
	subject: 'integration preliminaries',
	type: 'topic',
	description: 'How to integrate a terms such as 1/x',
	requires: ['integration preliminaries'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integration by inspection',
	subject: 'integration',
	type: 'topic',
	description: 'Reverse chain rule',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'lengths volumes and surfaces',
	subject: 'integration',
	type: 'topic',
	description: 'Basic geometry',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'integration by polar coordinates',
	subject: 'integration',
	type: 'topic',
	description: 'Using integration with polar coordinates',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'sequences and series',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'fourier series',
	subject: 'series',
	type: 'topic',
	description: 'Advanced calculus series',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'laplace transformation',
	subject: 'differentiation',
	type: 'topic',
	description: 'Integration and complex numbers combined',
	requires: ['integration', 'differentiation'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'fourier transform',
	subject: 'differentiation',
	type: 'topic',
	description: 'Uses integration to output a new function',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'ordinary differential equations',
	subject: 'differential equations',
	type: 'topic',
	description: 'ordinary differential equations',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'differential equations',
	subject: 'differentiation',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'first order differential equations',
	subject: 'differential equations',
	type: 'topic',
	description: 'Only uses single derivatives',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'second order differential equations',
	subject: 'differential equations',
	type: 'topic',
	description: 'Uses derivatives up to the second level',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'qualitative analysis',
	subject: 'calculus',
	type: 'topic',
	description: 'Uses heuristics to analyse data',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'bifurcations',
	subject: 'calculus',
	type: 'topic',
	description: 'Splitting into branches',
	requires: ['integration'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'multivariate calculus',
	subject: 'integration',
	type: 'topic',
	description: 'Differentiation and integration with multiple variables',
	requires: ['integration', 'differentiation'],
	links: 'www.example.com',
	approvals: 74,
	rejections: 23,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});



MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'basic arithmetic'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'limits'}), (subject:Subject{name:'LHospitals rule'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'limits'}), (subject:Subject{name:'limit ratio test'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'proofs'}), (subject:Subject{name:'LHospitals rule'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'proofs'}), (subject:Subject{name:'limit ratio test'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'basic arithmetic'}), (subject:Subject{name:'proofs'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'basic arithmetic'}), (subject:Subject{name:'limits'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'basic arithmetic'}), (subject:Subject{name:'differentiation'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'basic arithmetic'}), (subject:Subject{name:'integration'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'integration by substitution'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'integration by parts'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'product rule'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'chain rule'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'LHospitals rule'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'functions'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'integration preliminaries'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integration by substitution'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integration by parts'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integration by inspection'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a constant'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a positive power'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a negative power'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a fractional power'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a denominator variable'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'lengths volumes and surfaces'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'integration by polar coordinates'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integration by polar coordinates'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'sequences and series'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'sequences and series'}), (subject:Subject{name:'fourier series'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'laplace transform'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'fourier transform'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'ordinary differential equations'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'differential equations'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'first order differential equations'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'second order differential equations'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'qualitative analysis'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'bifurcations'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'multivariate calculus'})
CREATE (title) - [:IS_USED_IN] -> (subject);

// ------------------   Probability here   ------------------ //

CREATE (n:Subject{
	name:'probability and statistics',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});


CREATE (n:Subject{
	name: 'mean',
	subject: 'probability and statistics',
	type: 'topic',
	description: 'The study of averages',
	requires: ['probability and statistics'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'variance',
	subject: 'probability and statistics',
	type: 'topic',
	description: 'The study of skewness',
	requires: ['probability and statistics'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'standard deviation',
	subject: 'probability and statistics',
	type: 'topic',
	description: 'The study of averages',
	requires: ['variance'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'skewness',
	subject: 'probability and statistics',
	type: 'topic',
	description: 'The study of skew',
	requires: ['probability and statistics'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'moment generating function',
	subject: 'probability and statistics',
	type: 'topic',
	description: 'The study of generating mean, variance, standard deviation and skewness',
	requires: ['probability and statistics', 'mean', 'standard deviation', 'skewness'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'mean'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'variance'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'skewness'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'variance'}), (subject:Subject{name:'standard deviation'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'mean'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'standard deviation'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'skewness'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN] -> (subject)

// ------------ A level maths here -------------------

CREATE (n:Subject{
	name:'a level maths',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});

CREATE (n:Subject{
	name: 'numerical methods',
	subject: 'a level maths',
	type: 'topic',
	description: 'For when analytical solutions are not available',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'rotate lines around x and y axes',
	subject: 'a level maths',
	type: 'topic',
	description: 'Find the volume contained within a curve',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'matrices',
	subject: 'a level maths',
	type: 'topic',
	description: 'Represent a table of data',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'determinant',
	subject: 'a level maths',
	type: 'topic',
	description: 'Tests whether matrix is invertible',
	requires: ['matrices'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'matrix multiplication',
	subject: 'a level maths',
	type: 'topic',
	description: 'Multiplying two matrices',
	requires: ['matrices'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'inverse matrices',
	subject: 'a level maths',
	type: 'topic',
	description: 'Find the inverse of a matrix',
	requires: ['matrices'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'exponentials',
	subject: 'a level maths',
	type: 'topic',
	description: 'Plot graphs of the form y=ab^x',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'logarithms',
	subject: 'a level maths',
	type: 'topic',
	description: 'Plot graphs of the form y=ax^b',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'hyperbolic trigonometry',
	subject: 'a level maths',
	type: 'topic',
	description: 'Study hyperbolic trigonometry functions like sinh, cosh, tanh',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'mechanics',
	subject: 'a level maths',
	type: 'topic',
	description: 'Study newtonian mechanics including forces',
	requires: ['a level maths'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'moments',
	subject: 'a level maths',
	type: 'topic',
	description: 'Rotational force',
	requires: ['mechanics'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

CREATE (n:Subject{
	name: 'constant acceleration formulae',
	subject: 'a level maths',
	type: 'topic',
	description: 'Study the SUVAT formulae',
	requires: ['mechanics'],
	links: 'www.example.com',
	approvals: 200,
	rejections: 30,
	comments: [],
	suggestions: [],
	resources: [],
	learning_objectives: []
});

MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'numerical methods'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'rotate lines around x and y axes'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'matrices'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'exponentials'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'logarithms'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'hyperbolic trigonometry'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'a level maths'}), (subject:Subject{name:'mechanics'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'matrices'}), (subject:Subject{name:'abc'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'matrices'}), (subject:Subject{name:'determinant'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'matrices'}), (subject:Subject{name:'matrix multiplication'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'matrices'}), (subject:Subject{name:'inverse matrices'})
CREATE (title) - [:IS_USED_IN] -> (subject);

MATCH (title:Subject{name: 'mechanics'}), (subject:Subject{name:'moments'})
CREATE (title) - [:IS_USED_IN] -> (subject);
MATCH (title:Subject{name: 'mechanics'}), (subject:Subject{name:'constant acceleration formulae'})
CREATE (title) - [:IS_USED_IN] -> (subject);
